Release Notes
=============


## Next release

**Fixed**

- GRMustache.swift passes all [mustache/spec tests for "Mustache lambdas"](https://github.com/mustache/spec/blob/v1.1.2/specs/%7Elambdas.yml).

**New**

- The `TagDelimiterPair` represents a pair of tag delimiters such as (`{{`,`}}`). It is the type of the properties `Configuration.tagDelimiterPair` and `Tag.tagDelimiterPair`.
- You can query the content type (Text or HTML) of a template with the `Template.contentType` property.
- Explicit support for the Swift `Set` type is provided by `func Box<T: MustacheBoxable>(set: Set<T>?) -> MustacheBox`.

**Incompatible changes**

- `Configuration.tagStartDelimiter` and `Configuration.tagEndDelimiter` have been replaced by `Configuration.tagDelimiterPair`
- `Template(string:, error:)` no longer accepts template strings that contain partial tags. In such case, it returns a `GRMustacheErrorDomain` error of code `GRMustacheErrorCodeTemplateNotFound`. To parse a template strings that contain partial tags that should be loaded from the main bundle resources, use an explicit `TemplateRepository(bundle: nil)`.


## v0.9.1

Released on 19 May, 2015

**New**

- support for [Carthage](https://github.com/Carthage/Carthage) (contribution by [@acwright](https://github.com/acwright))



## v0.9.0

Released on 12 May, 2015

**New**

- support for [CocoaPods](https://cocoapods.org) (contribution by [@marcelofabri](https://github.com/marcelofabri))