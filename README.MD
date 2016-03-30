# Bash License citations for Carthage 

Useful for grab License text from Carthage dependancies
As Carthage updates library frameworks for your project, the License citation page should also updates dynamically. 

This is a plugin to render the most recent Licenses

### 1 - compileText.sh 
include this as Run Script, to generated new license on each build OR Run after Carthage has build or updated, this will grab all License file inside the Carthage Checkout directory populate a PLIST 

### 2 - License.plist 
** start with a file name License.plist in your project directory with an License key as array, then the Items will be generated by compileText.sh 

```
License:Array 
	> Item 0: Dictionary 
			>> name:String = "SampleSwiftFramework"
			>> text:String = "The MIT License(MIT) ....."
	> Item 1: Dictionary 
			>> name:String = "SampleSwiftFramework2"
			>> text:String = "The MIT License(MIT) ....."
	> Item 2: Dictionary 
			>> 
```

Thanks to @HirokiTerashima0816

Suggestions and comments welcome! Hope this helps you 