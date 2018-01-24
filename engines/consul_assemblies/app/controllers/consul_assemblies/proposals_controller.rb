require_dependency "consul_assemblies/application_controller"

module ConsulAssemblies
  class ProposalsController < ApplicationController

    before_filter :load_meeting, only: [:new]

    skip_authorization_check



    def new
      @proposal = ConsulAssemblies::Proposal.new(meeting_id: params[:meeting_id])
    end

    def create
      @proposal = ConsulAssemblies::Proposal.new(proposal_params)
      if @proposal.save
        redirect_to @proposal.meeting
      else
        @meeting = @proposal.meeting
        render action: :new
      end
    end


    private

    def proposal_params
      params.require(:proposal).permit(
        :title,
        :description,
        :meeting_id,
        :assembly_id
      )
    end
    def load_meeting
      @meeting =  ConsulAssemblies::Meeting.find(params[:meeting_id])
    end
  end
end
