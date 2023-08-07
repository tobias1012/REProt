// Prevents additional console window on Windows in release, DO NOT REMOVE!!
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]
use pcap::Device;


mod datasources;
#[tauri::command]
fn get_devices() -> Vec<String>{
    let devices = Device::list().unwrap();
    
    let mut ret: Vec<String> = vec![];
    for device in devices {
      ret.push(device.name);
    }
    ret
}

#[derive(Clone, serde::Serialize)]
struct Payload {
  message: String,
}


fn main() {
  tauri::Builder::default()
    .invoke_handler(tauri::generate_handler![get_devices])
    .run(tauri::generate_context!())
    .expect("error while running tauri application");
}
