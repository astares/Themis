"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestThemisCoreTools,
	#superclass : #PackageManifest,
	#category : #'Themis-Core-Tools-Manifest'
}

{ #category : #'code-critics' }
ManifestThemisCoreTools class >> ruleClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#THWorldMenu)) #'2022-12-30T19:37:22.37506+01:00') )
]
