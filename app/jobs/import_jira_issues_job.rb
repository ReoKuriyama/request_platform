class ImportJiraIssuesJob < ApplicationJob
  SUMMARY_FIELD_NAME = 'summary'.freeze
  OFFICE_ID_FIELD_NAME = 'customfield_10043'.freeze
  ZENDESK_REPORTER_FIELD_NAME = 'customfield_10044'.freeze
  ZENDESK_TICKET_ID_FIELD_NAME = 'customfield_10045'.freeze
  DESCRIPTION_FIELD_NAME = 'customfield_10046'.freeze

  def perform
    get_issues_json[:issues].each do |issue|
      issue_data = issue[:fields]
      ticket = Ticket.new(
        subject: issue_data[SUMMARY_FIELD_NAME.to_sym],
        description: issue_data[DESCRIPTION.to_sym],
        office_id: issue_data[OFFICE_ID.to_sym],
        zendesk_ticket_id: issue_data[ZENDESK_TICKET_ID.to_sym],
        zendesk_reporter: [ZENDESK_REPORTER].to_sym,
        jira_issue_id: issue[:id]
      )
      ticket.save
    end
  end

  private

  def get_issues_json
    latest_ticket_id = Ticket.maximum('jira_issue_id')

    resoponse = Api::Jira.new.get_issues do |req|
      req.body = {
        jql: "id > #{latest_ticket_id}",
        maxResults: 15,
        fieldsByKeys: false,
        fields: [
          SUMMARY_FIELD_NAME,
          OFFICE_ID_FIELD_NAME,
          ZENDESK_REPORTER_FIELD_NAME,
          ZENDESK_TICKET_ID_FIELD_NAME,
          DESCRIPTION_FIELD_NAME
        ]
      }.to_json
    end

    JSON.parse(resoponse.body, { symbolize_names: true })
  end
end
