Trestle.resource(:gpxes) do
  menu do
    item :gpxes, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

 # Customize the form fields shown on the new/edit views.

  form do |gpx|
    text_field :name
    row do
      col(xs: 6) { static_field :updated_at, gpx.updated_at }
      col(xs: 6) { static_field :created_at, gpx.created_at }
    end
    select :user_id, User.all, include_blank: "--Select User--"
    gpx_activity = Gpx.activities.keys.map { |activity| [activity.humanize, activity]}
    select :activity, gpx_activity
    file_field :file

  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:gpx).permit(:name, ...)
  # end
end
