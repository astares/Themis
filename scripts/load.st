|creator repo|
IceRepository reset. "Discard all non-connected Pharo repos"

Author uniqueInstance fullName: 'TorstenBergmann'.

 IceCredentialStore current defaultSSHCredential 
    publicKey: '/home/kiwi/.ssh/id_ed25519.pub';
    privateKey: '/home/kiwi/.ssh/id_ed25519'.

"Connect Iceberg to this project repository"
creator := IceRepositoryCreator new.
repo := creator repository.
repo 
    name: 'Themis';
    location: Smalltalk imageDirectory parent asFileReference;
	 checkoutBranch: 'main'.
repo register.

"Open Iceberg"
IceTipRepositoriesBrowser new open
