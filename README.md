# Hetzner Cloud Ruby Client

Manage your hetzner cloud server with ruby!

## Getting Started

Quickstart

```ruby
require 'hcloud'

Hcloud::Client.configure token: "my-token"

action = Hcloud::V1::Action.find(1)

```

### Prerequisites

Please take a look at the [Api documentation](https://docs.hetzner.cloud/)

## Running the tests

Run ``bundle exec rspec``

## Deployment

Hcloud will be available as gem.

## Contributing

Todo

## Versioning

We use [SemVer](http://semver.org/) for versioning.

## Authors

* **Niklas Hanft** - *Initial work* - [NiklasHanft](https://github.com/nhh)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

Todo
