|creator repo|
IceRepository reset. "Discard all non-connected Pharo repos"

Author uniqueInstance fullName: 'TorstenBergmann'.

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
