# DataBLEScan

A little Ruby script that converts a raw dump of `hcitool` ble scan output to a readable log showing nearby iBeacons.

## Installation

### Dependencies

DataBLEScan is a wrapper around the `hcitool` and `hcidump` binaries.

These dependencies are provided by installing the following Raspbian packages:

```sh
sudo apt-get install -y bluez bluez-dump
```

### Gem

```sh
gem install datable_scan
```

## Usage

```sh
sudo datable_scan
```

## Contributing

Please do. Just start an Issue ticket with your idea or open a Pull Request!

## License

GPLv3
