# Crypted

- Theses keys have been cryptyed use `ansible-vault`
- Putting this keys publicly on internet is a BAD PRACTICE and MUST NOT BE DONE
- This repository does it because :
  - What is in the files is not criticaly sensitive
  - The encryption algorithm used AES256 is considered has extremely secured

## Risks

- Quantum computing might provide a way to break the encryption in an human time period
- Since theses files are public, you are exposed to [Harvest now, breaks later](https://en.wikipedia.org/wiki/Harvest_now,_decrypt_later)

## In case of disclosure

- Ban previous access keys
- Create regenerate new access keys
- Encrypt them with an algorithm that is considered secured
- If applicable made them not public

## Mitigation strategy

- Create regular backup of your projects/files/system
- Isolate them from everything (physicaly)
