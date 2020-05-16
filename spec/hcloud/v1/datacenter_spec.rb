require "spec_helper"
require "hcloud"
require "json"

describe Hcloud::V1::Datacenter do

  before :all do
    Hcloud::Client.configure({ token: "test-token" })
  end

  it "returns a list of datacenters without parameters" do
    stubbed_body = {
        "datacenters": [
            {
                "id": 1,
                "name": "fsn1-dc8",
                "description": "Falkenstein 1 DC 8",
                "location": {
                    "id": 1,
                    "name": "fsn1",
                    "description": "Falkenstein DC Park 1",
                    "country": "DE",
                    "city": "Falkenstein",
                    "latitude": 50.47612,
                    "longitude": 12.370071,
                    "network_zone": "eu-central"
                },
                "server_types": {
                    "supported": [
                        1,
                        2,
                        3
                    ],
                    "available": [
                        1,
                        2,
                        3
                    ],
                    "available_for_migration": [
                        1,
                        2,
                        3
                    ]
                }
            }
        ],
        "recommendation": 1
    }.to_json
    stub_request(:get, "https://api.hetzner.cloud/v1/datacenters")
        .with(headers: {
            'Authorization': 'Bearer test-token',
            'Connection': 'close',
            'Host': 'api.hetzner.cloud',
            'User-Agent': 'http.rb/4.4.1'
        }).to_return(status: 200, body: stubbed_body, headers: {})

    actions = Hcloud::V1::Datacenter.all
    expect(actions.first.is_a? Hcloud::V1::Datacenter).to be true
  end

  it "returns a list of datacenters with name parameter" do
    stubbed_body = {
        "datacenters": [
            {
                "id": 1,
                "name": "fsn1-dc8",
                "description": "Falkenstein 1 DC 8",
                "location": {
                    "id": 1,
                    "name": "fsn1",
                    "description": "Falkenstein DC Park 1",
                    "country": "DE",
                    "city": "Falkenstein",
                    "latitude": 50.47612,
                    "longitude": 12.370071,
                    "network_zone": "eu-central"
                },
                "server_types": {
                    "supported": [
                        1,
                        2,
                        3
                    ],
                    "available": [
                        1,
                        2,
                        3
                    ],
                    "available_for_migration": [
                        1,
                        2,
                        3
                    ]
                }
            }
        ],
        "recommendation": 1
    }.to_json
    stub_request(:get, "https://api.hetzner.cloud/v1/datacenters?name=fsn1-dc8")
        .with(headers: {
            'Authorization': 'Bearer test-token',
            'Connection': 'close',
            'Host': 'api.hetzner.cloud',
            'User-Agent': 'http.rb/4.4.1'
        }).to_return(status: 200, body: stubbed_body, headers: {})

    actions = Hcloud::V1::Datacenter.all("fsn1-dc8")
    expect(actions.first.is_a? Hcloud::V1::Datacenter).to be true
  end

  it "returns a specific datacenter" do
    stubbed_body = {
        "datacenter": {
            "id": 1,
            "name": "fsn1-dc8",
            "description": "Falkenstein 1 DC 8",
            "location": {
                "id": 1,
                "name": "fsn1",
                "description": "Falkenstein DC Park 1",
                "country": "DE",
                "city": "Falkenstein",
                "latitude": 50.47612,
                "longitude": 12.370071,
                "network_zone": "eu-central"
            },
            "server_types": {
                "supported": [
                    1,
                    2,
                    3
                ],
                "available": [
                    1,
                    2,
                    3
                ],
                "available_for_migration": [
                    1,
                    2,
                    3
                ]
            }
        }
    }.to_json
    stub_request(:get, "https://api.hetzner.cloud/v1/datacenters/1")
        .with(headers: {
            'Authorization': 'Bearer test-token',
            'Connection': 'close',
            'Host': 'api.hetzner.cloud',
            'User-Agent': 'http.rb/4.4.1'
        }).to_return(status: 200, body: stubbed_body, headers: {})
    action = Hcloud::V1::Datacenter.find(1)
    expect(action.is_a? Hcloud::V1::Datacenter).to be true
  end

end

