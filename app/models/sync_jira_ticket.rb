class SyncJiraTicket
  OFFICE_ID = :customfield_10043
  ZENDESK_REPORTER = :customfield_10044
  ZENDESK_TICKET_ID = :customfield_10045
  DESCRIPTION = :customfield_10046

  def self.call
    json = Api::Jira::Issue.new.search(latest_ticket_id: Ticket.maximum('jira_issue_id'))

    json[:issues].each do |issue|
      issue_data = issue[:fields]
      ticket = Ticket.new(subject: issue_data[:summary], description: issue_data[DESCRIPTION], office_id: issue_data[OFFICE_ID], zendesk_ticket_id: issue_data[ZENDESK_TICKET_ID], zendesk_reporter: [ZENDESK_REPORTER], jira_issue_id: issue[:id] )
      ticket.save
    end
  end
end
