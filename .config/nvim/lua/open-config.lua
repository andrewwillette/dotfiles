local open_config = {
  jiras = {
    {
      name = "breguet jira board",
      url = "https://jira.kdc.capitalone.com/secure/RapidBoard.jspa?rapidView=69269"
    },
    {
      name = "breguet / extream (Core STASH Accounts) jira board",
      url = "https://jira.kdc.capitalone.com/secure/RapidBoard.jspa?rapidView=66138"
    },
    {
      name = "omega jira board",
      url = "https://jira.kdc.capitalone.com/secure/RapidBoard.jspa?rapidView=69269"
    },
    {
      name = "omega tech improvements",
      url = "https://jira.kdc.capitalone.com/browse/CPALIN-2660"
    },
    {
      name = "jaguar jira board",
      url = "https://jira.kdc.capitalone.com/secure/RapidBoard.jspa?rapidView=65685"
    },
    {
      name = "koala tea, (jaguar sister team) jira board",
      url = "https://jira.kdc.capitalone.com/secure/RapidBoard.jspa?rapidView=37076&projectKey=COREDATA"
    },
    {
      name = "jaguar tech improvements",
      url = "https://jira.kdc.capitalone.com/browse/COREDATA-2129"
    },
    {
      name = "team axolotl jira board",
      url = "https://jira.kdc.capitalone.com/secure/RapidBoard.jspa?rapidView=69012"
    },
    {
      name = "team axolotl orion onboarding epic",
      url = "https://jira.kdc.capitalone.com/browse/CPALIN-3308"
    },
    {
      name = "team independence jira board",
      url = "https://jira.kdc.capitalone.com/secure/RapidBoard.jspa?rapidView=68927"
    },
    {
      name = "team independence orion onboarding rewards - transaction data epic, loyalty-spend-agg-api",
      url = "https://jira.kdc.capitalone.com/browse/CPALORION-1251"
    },
    {
      name = "team independence orion onboarding rewards - account status data epic, eligibility-ny-law",
      url = "https://jira.kdc.capitalone.com/browse/CPALORION-1262"
    },
    {
      name = "team fresca jira board",
      url = "https://jira.kdc.capitalone.com/secure/RapidBoard.jspa?rapidView=69437"
    },
    {
      name = "team rainier jira board",
      url = "https://jira.kdc.capitalone.com/secure/RapidBoard.jspa?rapidView=69747&projectKey=CPALORION&view=detai"
    },
    {
      name = "team orizaba jira board",
      url = "https://jira.kdc.capitalone.com/secure/RapidBoard.jspa?rapidView=69444&view=detail"
    },
    {
      name = "team dahlia JIRA board",
      url = "https://jira.kdc.capitalone.com/secure/RapidBoard.jspa?rapidView=69721&view=detail"
    },
    {
      name = "team chapala JIRA board",
      url = "https://jira.kdc.capitalone.com/secure/RapidBoard.jspa?rapidView=69861&view=planning"
    },
    {
      name = "team chapala vulnerability epic",
      url = "https://jira.kdc.capitalone.com/browse/CPALIN-2929"
    },
  },
  splunk = {
    {
      name = "graphQL dashboards, query by acct ref ID",
      url = "https://splunkoneqa.clouddqt.capitalone.com/en-US/app/CARD_ASVCOREGRAPH/dashboards"
    },
    {
      name = "Card Core GraphQL Transactions API",
      url = "https://splunkoneqa.clouddqt.capitalone.com/en-US/app/search/card_core_graphql_transactions_api?form.field1.earliest=-4h&form.field1.latest=now&form.accountref_id=*&form.correlation_id=*"
    },
  },
  jenkins = {
    {
      name = "commercialcreditsolutions cml-approval-routing",
      url = "https://commercialcreditsolutionsjenkins.cloud.capitalone.com/job/Bogie/job/cml-approval-routing/"
    },
    {
      name = "card-nuc-1 cash",
      url = "https://card-nuc-n1jenkins.cloud.capitalone.com/job/Bogie/job/cash/"
    },
    {
      name = "cash-posted-transactions-event-handler",
      url = "https://card-nuc-n1jenkins.cloud.capitalone.com/job/Bogie/job/cash/job/cash-posted-transactions-event-handler/"
    },
    {
      name = "team independence updating loyalty-eligibility-api-v2",
      url = "https://card-rwds-n1jenkins.cloud.capitalone.com/job/Bogie/job/LoyaltyRedemptionOrders/job/loyalty-eligibility-api-v2/"
    },
    {
      name = "reference-client-app",
      url = "https://card-nuc-n2jenkins.cloud.capitalone.com/job/Bogie/job/o2/job/reference-client-app/"
    },
    {
      name = "loyalty-eligibility-api-v2",
      url = "https://card-rwds-n1jenkins.cloud.capitalone.com/job/Bogie/job/LoyaltyRedemptionOrders/job/loyalty-eligibility-api-v2/"
    },
  },
  newrelic = {
    {
      name = "Card Core GraphQL Accounts",
      url = "https://onenr.io/0PwJmpWOBQ7"
    },
    {
      name = "cash-graphql-accounts-api",
      url = "https://onenr.io/0oQD7WbA2jy"
    },
    {
      name = "cash-graphql-transactions-api",
      url = "https://onenr.io/0VjYdDJGXR0"
    },
    {
      name = "coregraph-dpi-accounts-prod OTEL page",
      url = "https://onenr.io/0qwLoLoGbQ5"
    },
    {
      name = "STASH (streaming) QA dashboard",
      url = "https://onenr.io/0dQegpkKZRe"
    },
    {
      name = "STASH (streaming) PROD dashboard",
      url = "https://onenr.io/0BQ1Yr8MAQx"
    }
  },
  confluence = {
    {
      name = "Orion teams Andrew Willette page",
      url = "https://splunkoneqa.clouddqt.capitalone.com/en-US/app/CARD_ASVCOREGRAPH/dashboards"
    },
    {
      name = "Card Core GraphQL Transactions API",
      url = "https://splunkoneqa.clouddqt.capitalone.com/en-US/app/search/card_core_graphql_transactions_api?form.field1.earliest=-4h&form.field1.latest=now&form.accountref_id=*&form.correlation_id=*"
    },
  },
}

return open_config
