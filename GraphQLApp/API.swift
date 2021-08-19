// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class RickMortyCharactersdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query rickMortyCharactersd {
      episodesByIds(ids: [1, 3]) {
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

  public let operationName: String = "rickMortyCharactersd"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("episodesByIds", arguments: ["ids": [1, 3]], type: .list(.object(EpisodesById.selections))),
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

public final class DenemeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query deneme($id: ID!) {
      episode(id: $id) {
        __typename
        characters {
          __typename
          id
          name
          status
          species
          type
          gender
          image
        }
      }
    }
    """

  public let operationName: String = "deneme"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("episode", arguments: ["id": GraphQLVariable("id")], type: .object(Episode.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(episode: Episode? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "episode": episode.flatMap { (value: Episode) -> ResultMap in value.resultMap }])
    }

    /// Get a specific episode by ID
    public var episode: Episode? {
      get {
        return (resultMap["episode"] as? ResultMap).flatMap { Episode(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "episode")
      }
    }

    public struct Episode: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Episode"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("characters", type: .nonNull(.list(.object(Character.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(characters: [Character?]) {
        self.init(unsafeResultMap: ["__typename": "Episode", "characters": characters.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(String.self)),
            GraphQLField("species", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("gender", type: .scalar(String.self)),
            GraphQLField("image", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, status: String? = nil, species: String? = nil, type: String? = nil, gender: String? = nil, image: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name, "status": status, "species": species, "type": type, "gender": gender, "image": image])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the character.
        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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

        /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
        public var gender: String? {
          get {
            return resultMap["gender"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
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
      }
    }
  }
}

public final class EpisodeQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query EpisodeQuery {
      episodesByIds(
        ids: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41]
      ) {
        __typename
        id
        name
        air_date
        episode
        created
      }
    }
    """

  public let operationName: String = "EpisodeQuery"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("episodesByIds", arguments: ["ids": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41]], type: .list(.object(EpisodesById.selections))),
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
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("air_date", type: .scalar(String.self)),
          GraphQLField("episode", type: .scalar(String.self)),
          GraphQLField("created", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, airDate: String? = nil, episode: String? = nil, created: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Episode", "id": id, "name": name, "air_date": airDate, "episode": episode, "created": created])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the episode.
      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
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

      /// The air date of the episode.
      public var airDate: String? {
        get {
          return resultMap["air_date"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "air_date")
        }
      }

      /// The code of the episode.
      public var episode: String? {
        get {
          return resultMap["episode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "episode")
        }
      }

      /// Time at which the episode was created in the database.
      public var created: String? {
        get {
          return resultMap["created"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "created")
        }
      }
    }
  }
}

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
