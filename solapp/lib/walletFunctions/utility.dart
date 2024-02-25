String shortenAddress(String address) {
  return address.replaceRange(5, address.length - 5, "...");
}
