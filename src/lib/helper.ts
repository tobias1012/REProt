export function printable(num: number){
    if (num < 32 || num > 127) {
        return ".";
    }
    return String.fromCharCode(num);
}