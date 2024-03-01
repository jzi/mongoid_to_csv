require 'mongoid'
require 'csv'

module MongoidToCSV
  cattr_accessor(:csv_separator) {','}

  # Return full CSV content with headers as string.
  # Defined as class method which will have chained scopes applied.
  def to_csv(*only_fields)
    only_fields = fields if only_fields.empty?
    documents_to_csv(all, only_fields)
  end

  module_function

  def documents_to_csv(documents, fields = documents.first.class.fields)
    doc_class = documents.first.class
    fields = fields.keys if fields.is_a? Hash
    csv_columns = fields - %w{_id created_at updated_at _type}
    header_row = csv_columns.to_csv(col_sep: csv_separator)
    records_rows = documents.map do |record|
      csv_columns.map do |column|
        value = record.send(column)
        value = value.to_csv if value.respond_to?(:to_csv)
        value
      end.to_csv(col_sep: csv_separator)
    end.join
    header_row + records_rows
  end

end

module Mongoid::Document
  def self.included(target)
    target.extend MongoidToCSV
  end
end

# Define Relation#to_csv so that method_missing will not
# delegate to array.
class Mongoid::Relation
  def to_csv
    scoping do
      @klass.to_csv
    end
  end
end

class Array
  def mongoid_to_csv
    return self if empty?
    MongoidToCSV.documents_to_csv(self)
  end
end
