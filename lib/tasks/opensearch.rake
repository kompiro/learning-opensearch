namespace :opensearch do

  client = OpenSearch::Client.new(
    host: 'https://admin:admin@opensearch-node1:9200',
    transport_options: { ssl: { verify: false } })

  desc 'Create company indices'
  task :create_company_index do
    response = client.indices.create(
      index: :companies,
      body: {
        mappings: {
          properties: {
            name: { type: 'text' },
            industry: { type: 'text' },
            logo: { type: 'text' },
            type: { type: 'text' }
          }
        }
      }
    )
    puts response

    documents = []
    100.times do |id|
      documents << { index: { _index: :companies, _id: id } }
      documents << {
        "name": Faker::Company.name,
        "industry": Faker::Company.industry,
         "logo": Faker::Company.logo,
         "type": Faker::Company.type
      }
    end
    puts client.bulk(body: documents)
  end

  desc 'Create company v2 indices'
  task :create_company_v2_index do
    response = client.indices.create(
      index: :companies_v2,
      body: {
        mappings: {
          properties: {
            name: { type: 'text' },
            industry: { type: 'text' },
            logo: { type: 'text' },
            type: { type: 'text' },
            profession: { type: 'text' }
          }
        }
      }
    )
    puts response

    documents = []
    100.times do |id|
      documents << { index: { _index: :companies_v2, _id: id } }
      documents << {
        "name": Faker::Company.name,
        "industry": Faker::Company.industry,
         "logo": Faker::Company.logo,
         "type": Faker::Company.type,
         "profession": Faker::Company.profession
      }
    end
    puts client.bulk(body: documents)
  end

  desc 'Create employee indices'
  task :create_employee_index do
    response = client.indices.create(
      index: :employee,
      body: {
        mappings: {
          properties: {
            name: { type: 'text' },
            company_name: { type: 'text' },
            profession: { type: 'text' }
          }
        }
      }
    )
    puts response

    documents = []
    100.times do |id|
      documents << { index: { _index: :employee, _id: id } }
      documents << {
        "name": Faker::Name.name,
        "company_name": Faker::Company.name,
        "profession": Faker::Company.profession
      }
    end
    puts client.bulk(body: documents)
  end

  desc 'Delete test indices'
  task :delete_indices do
    response = client.indices.delete(index: [:companies, :companies_v2, :employee])
    puts response
  end

  desc 'Show opensearch info'
  task :info do
    puts client.info
  end
end
