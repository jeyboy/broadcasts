ActiveAdmin.register Broadcasts do
  config.sort_order = 'name_asc'
  config.batch_actions = false #comment this if you need batches

  #actions :all, :except => [:destroy, :new]

  #index as: :grid do |email_template|
  #  a email_template.name.humanize, href: admin_mail_template_path(email_template)
  #end
  #
  #show do |email_template|
  #  attributes_table do
  #    row :subject
  #    row :body do
  #      raw email_template.body
  #    end
  #  end
  #end
  #
  #sidebar :email_objects, :only => :edit do
  #  table_for([]) do
  #    tr { td 'You may use next constants : ' }
  #    resource.prepare_fields.each { |item| tr { td item} }
  #  end
  #end
  #
  #form do |f|
  #  f.inputs do
  #    f.input :subject
  #    f.input :body  #, :as => :rich  # You may use this flag if you have installed gem 'rich'
  #  end
  #  f.actions
  #end
end
