-- uncomment to test from local solution
-- vim.cmd("set rtp+=~/git/health_check_nvim")

local health_check_nvim = require "health_check_nvim"
local microservice_health_check_path = "/admin/health"
local scala_health_check_path = "/health"

local pfc_health_checks_dev = function()
  health_check_nvim.health_check({
    { url = "https://participants-datastore-dev.clouddqt.capitalone.com" .. microservice_health_check_path,       expected_response_code = 200 },
    { url = "https://collaterals-datastore-dev.clouddqt.capitalone.com" .. microservice_health_check_path,        expected_response_code = 200 },
    { url = "https://account-attributes-datastore-dev.clouddqt.capitalone.com" .. microservice_health_check_path, expected_response_code = 200 },
    { url = "https://prom-ledger-dev-e-b.clouddqt.capitalone.com" .. scala_health_check_path,                     expected_response_code = 200 },
    { url = "https://prom-pfc-orch-dev.clouddqt.capitalone.com" .. scala_health_check_path,                       expected_response_code = 200 },
    { url = "https://loan-query-dev.clouddqt.capitalone.com" .. scala_health_check_path,                          expected_response_code = 200 },
    { url = "https://dealer-query-dev.clouddqt.capitalone.com" .. scala_health_check_path,                        expected_response_code = 200 },
    { url = "https://prom-pfc-txhub-dev-e-b.clouddqt.capitalone.com" .. scala_health_check_path,                  expected_response_code = 200 },
    { url = "https://prom-pfc-dlr-txhub-dev-e-b.clouddqt.capitalone.com" .. scala_health_check_path,              expected_response_code = 200 },
    { url = "https://acc-mhub-dev.clouddqt.capitalone.com" .. microservice_health_check_path,                     expected_response_code = 200 },
  })
end

pfc_health_checks_dev()
