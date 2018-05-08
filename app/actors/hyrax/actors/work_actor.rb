# Generated via
#  `rails generate hyrax:work Work`
module Hyrax
  module Actors
    class WorkActor < Hyrax::Actors::BaseActor
      ##
      # This actor transforms all titles to title case.
      #
      # @see Hyrax::Actors::AbstractActor#create
      def create(env)
        env.attributes['title'].map!(&:titleize)

        super && RemoteIdentifierJob.perform_later(env.curation_concern)
      end
    end
  end
end
