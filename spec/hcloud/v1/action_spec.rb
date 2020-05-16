require "spec_helper"
require "hcloud"
require "json"

describe Hcloud::V1::Action do

  before :all do
    Hcloud::Client.configure({ token: "test-token" })
  end

  it "returns a list of actions" do
    stubbed_body = "{\n  \"actions\": [\n    {\n      \"id\": 63033404,\n      \"command\": \"create_image\",\n      \"status\": \"running\",\n      \"progress\": 15,\n      \"started\": \"2020-05-15T16:02:16+00:00\",\n      \"finished\": null,\n      \"resources\": [\n        {\n          \"id\": 5772106,\n          \"type\": \"server\"\n        },\n        {\n          \"id\": 16480498,\n          \"type\": \"image\"\n        }\n      ],\n      \"error\": null\n    }\n  ],\n  \"meta\": {\n    \"pagination\": {\n      \"page\": 1,\n      \"per_page\": 25,\n      \"previous_page\": null,\n      \"next_page\": null,\n      \"last_page\": 1,\n      \"total_entries\": 1\n    }\n  }\n}\n"
    stub_request(:get, "https://api.hetzner.cloud/v1/actions?sort=id&status=running")
        .with(headers: {
            'Authorization': 'Bearer test-token',
            'Connection': 'close',
            'Host': 'api.hetzner.cloud',
            'User-Agent': 'http.rb/4.4.1'
        }).to_return(status: 200, body: stubbed_body, headers: {})

    actions = Hcloud::V1::Action.all(Hcloud::ActionStatus::RUNNING, Hcloud::ActionSort::ID_SORT)
    expect(actions.first.is_a? Hcloud::V1::Action).to be true
  end

  it "returns a single action " do
    stubbed_body = {
        "id": 13,
        "command": "start_server",
        "status": "success",
        "progress": 100,
        "started": "2016-01-30T23:55:00+00:00",
        "finished": "2016-01-30T23:56:00+00:00",
        "resources": [
            {
                "id": 42,
                "type": "server"
            }
        ],
        "error": {
            "code": "action_failed",
            "message": "Action failed"
        }
    }.to_json

    stub_request(:get, "https://api.hetzner.cloud/v1/actions/1")
        .with(headers: {
            'Authorization': 'Bearer test-token',
            'Connection': 'close',
            'Host': 'api.hetzner.cloud',
            'User-Agent': 'http.rb/4.4.1'
        }).to_return(status: 200, body: stubbed_body, headers: {})

    action = Hcloud::V1::Action.find(1)
    expect(action.is_a? Hcloud::V1::Action).to be true
  end

end

