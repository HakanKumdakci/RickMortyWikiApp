// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class RickMortyQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query RickMorty {
      episodesByIds(ids: [1]) {
        __typename
        name
        characters {
          __typename
          name
        }
      }
    }
    """

  public let operationName: String = "RickMorty"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("episodesByIds", arguments: ["ids": [1]], type: .list(.object(EpisodesById.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(episodesByIds: [EpisodesById?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "episodesByIds": episodesByIds.flatMap { (value: [EpisodesById?]) -> [ResultMap?] in value.map { (value: EpisodesById?) -> ResultMap? in value.flatMap { (value: EpisodesById) -> ResultMap in value.resultMap } } }])
    }

    /// Get a list of episodes selected by ids
    public var episodesByIds: [EpisodesById?]? {
      get {
        return (resultMap["episodesByIds"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [EpisodesById?] in value.map { (value: ResultMap?) -> EpisodesById? in value.flatMap { (value: ResultMap) -> EpisodesById in EpisodesById(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [EpisodesById?]) -> [ResultMap?] in value.map { (value: EpisodesById?) -> ResultMap? in value.flatMap { (value: EpisodesById) -> ResultMap in value.resultMap } } }, forKey: "episodesByIds")
      }
    }

    public struct EpisodesById: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Episode"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("characters", type: .nonNull(.list(.object(Character.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, characters: [Character?]) {
        self.init(unsafeResultMap: ["__typename": "Episode", "name": name, "characters": characters.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the episode.
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// List of characters who have been seen in the episode.
      public var characters: [Character?] {
        get {
          return (resultMap["characters"] as! [ResultMap?]).map { (value: ResultMap?) -> Character? in value.flatMap { (value: ResultMap) -> Character in Character(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } }, forKey: "characters")
        }
      }

      public struct Character: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Character"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Character", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the character.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class RickMortyCharactersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query rickMortyCharacters {
      episodesByIds(ids: [1, 2, 3]) {
        __typename
        name
        characters {
          __typename
          name
          status
          image
          species
          type
          location {
            __typename
            name
          }
        }
      }
    }
    """

  public let operationName: String = "rickMortyCharacters"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("episodesByIds", arguments: ["ids": [1, 2, 3]], type: .list(.object(EpisodesById.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(episodesByIds: [EpisodesById?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "episodesByIds": episodesByIds.flatMap { (value: [EpisodesById?]) -> [ResultMap?] in value.map { (value: EpisodesById?) -> ResultMap? in value.flatMap { (value: EpisodesById) -> ResultMap in value.resultMap } } }])
    }

    /// Get a list of episodes selected by ids
    public var episodesByIds: [EpisodesById?]? {
      get {
        return (resultMap["episodesByIds"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [EpisodesById?] in value.map { (value: ResultMap?) -> EpisodesById? in value.flatMap { (value: ResultMap) -> EpisodesById in EpisodesById(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [EpisodesById?]) -> [ResultMap?] in value.map { (value: EpisodesById?) -> ResultMap? in value.flatMap { (value: EpisodesById) -> ResultMap in value.resultMap } } }, forKey: "episodesByIds")
      }
    }

    public struct EpisodesById: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Episode"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("characters", type: .nonNull(.list(.object(Character.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, characters: [Character?]) {
        self.init(unsafeResultMap: ["__typename": "Episode", "name": name, "characters": characters.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the episode.
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// List of characters who have been seen in the episode.
      public var characters: [Character?] {
        get {
          return (resultMap["characters"] as! [ResultMap?]).map { (value: ResultMap?) -> Character? in value.flatMap { (value: ResultMap) -> Character in Character(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } }, forKey: "characters")
        }
      }

      public struct Character: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Character"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(String.self)),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("species", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("location", type: .object(Location.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, status: String? = nil, image: String? = nil, species: String? = nil, type: String? = nil, location: Location? = nil) {
          self.init(unsafeResultMap: ["__typename": "Character", "name": name, "status": status, "image": image, "species": species, "type": type, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the character.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The status of the character ('Alive', 'Dead' or 'unknown').
        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        /// The species of the character.
        public var species: String? {
          get {
            return resultMap["species"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "species")
          }
        }

        /// The type or subspecies of the character.
        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        /// The character's last known location
        public var location: Location? {
          get {
            return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "location")
          }
        }

        public struct Location: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Location"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Location", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the location.
          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}
