require 'opensearch-ruby'

client = OpenSearch::Client.new(
  host: 'https://admin:admin@opensearch-node1:9200',
  transport_options: { ssl: { verify: false } })

# バージョンの異なるschemaで横断検索
query = {
  'size': 10,
  'query': {
    'match_phrase': {
      "profession": "actress"
    }
  }
}

puts client.search(
  body: query,
  index: ['companies*']
).to_json

# 異なるschemaで横断検索
query = {
  'size': 10,
  'query': {
    'match_phrase': {
      "profession": "actress"
    }
  }
}

puts client.search(
  body: query,
  index: ['companies_v2', 'employee']
).to_json