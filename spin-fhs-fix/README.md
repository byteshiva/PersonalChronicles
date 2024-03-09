# Spin FHS Fix

Fixing Spin to adhere to the Filesystem Hierarchy Standard (FHS).

## Steps

1. Update `shell.nix` with essential tools and dependencies.

   ```nix
   { pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {} }:

   (pkgs.buildFHSEnv {
     name = "simple-env";
     targetPkgs = pkgs: (with pkgs; [vim git nodejs fermyon-spin]);
     runScript = "bash";
   }).env
   ```

2. Test the environment.
   ```bash
   nix-shell
   ```

3. Install Spin templates.
   ```bash
   spin templates install --git https://github.com/fermyon/spin-js-sdk --update
   ```

4. Install the `js2wasm` plugin.
   ```bash
   spin plugins install js2wasm
   ```

5. Create a new Spin application.
   ```bash
   spin new
   ```

6. Build and run the application.
   ```bash
   cd hello_ts/
   npm install
   spin build
   spin up
   ```

Visit http://127.0.0.1:3000 to access your Spin application.

## Conclusion

Follow these steps to restore FHS in your Spin environment for a more standardized and stable development experience.
