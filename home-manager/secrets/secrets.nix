let
  zexoen = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJuIi6OSaG4aHowyv9ppfGX1a6vVIjL8EXb2isGfoETw agenix key";
in
{
  "passwd-imap-126.age".publicKeys = [ zexoen ];
  "123pan-rclone.age".publicKeys = [ zexoen ];
}
