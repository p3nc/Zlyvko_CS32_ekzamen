require 'json'
require 'rspec'


def hash_to_json(my_hash)
  JSON.pretty_generate(my_hash)
end

def json_to_hash(json_string)
  JSON.parse(json_string)
end

# Тести
RSpec.describe 'JSON Converter' do
  let(:sample_hash) { { name: "Vasyl", age: 71, city: "Kharkiv" } }
  let(:sample_json) { "{\"name\":\"Vasyl\",\"age\":71,\"city\":\"Kharkiv\"}" }

  describe '#hash_to_json' do
    it 'повертає відформатований JSON з хешу' do
      json_string = hash_to_json(sample_hash)
      expect(json_string).to eq("{\n  \"name\": \"Vasyl\",\n  \"age\": 71,\n  \"city\": \"Kharkiv\"\n}")
    end
  end

  describe '#json_to_hash' do
    it 'повертає хеш з JSON' do
      hash = json_to_hash(sample_json)
      expect(hash).to eq({ "name" => "Vasyl", "age" => 71, "city" => "Kharkiv" })
    end
  end
end
