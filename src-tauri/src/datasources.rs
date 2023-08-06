use pcap::Device;

def get_devices() {
    let devices = Device::list().unwrap();
    devices
}