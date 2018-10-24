namespace :db do
  task :sample_data => :environment do
    create_record Employee, {
      email: 'test@example.com',
      first_name: 'Sample',
      last_name: 'User'
    }
  end

  def create_record(klass, data, where: {email: :email})
    criteria = Hash[where.map do |db_field, data_field|
      [db_field, data[data_field] || data[data_field.to_sym]]
    end]
    unless object = klass.where(criteria).first.present?
      puts "Creating record #{klass} matching #{criteria}"
      object = klass.new
      object.assign_attributes(data)
      object.save!
    else
      puts "Skipping record #{klass} matching #{criteria} - already exists"
    end
    object
  end

end