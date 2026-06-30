const express = require("express");
const cors = require("cors");

const { graphqlHTTP } = require("express-graphql");

const {
  GraphQLSchema,
  GraphQLObjectType,
  GraphQLString,
  GraphQLList,
  GraphQLInt,
  GraphQLNonNull,
  GraphQLBoolean,
} = require("graphql");

const app = express();

app.use(cors());

/// =======================================
/// IN MEMORY DATA
/// =======================================

let courses = [
  {
    id: 1,
    name: "Flutter Basics",
    likes: 10,
  },

  {
    id: 2,
    name: "Advanced Dart",
    likes: 5,
  },
];

/// =======================================
/// COURSE TYPE
/// =======================================

const CourseType = new GraphQLObjectType({
  name: "Course",

  fields: () => ({
    id: {
      type: GraphQLInt,
    },

    name: {
      type: GraphQLString,
    },

    likes: {
      type: GraphQLInt,
    },
  }),
});

/// =======================================
/// ROOT QUERY
/// =======================================

const RootQuery = new GraphQLObjectType({
  name: "RootQueryType",

  fields: {
    courses: {
      type: new GraphQLList(CourseType),

      resolve(parent, args) {
        return courses;
      },
    },
  },
});

/// =======================================
/// MUTATIONS
/// =======================================

const Mutation = new GraphQLObjectType({
  name: "Mutation",

  fields: {
    /// ADD COURSE
    addCourse: {
      type: CourseType,

      args: {
        name: {
          type: new GraphQLNonNull(GraphQLString),
        },
      },

      resolve(parent, args) {
        const newCourse = {
          id: courses.length + 1,
          name: args.name,
          likes: 0,
        };

        courses.push(newCourse);

        return newCourse;
      },
    },

    /// DELETE COURSE
    deleteCourse: {
      type: GraphQLBoolean,

      args: {
        id: {
          type: new GraphQLNonNull(GraphQLInt),
        },
      },

      resolve(parent, args) {
        courses = courses.filter(course => course.id !== args.id);

        return true;
      },
    },

    /// INCREMENT LIKES
    incrementLikes: {
      type: CourseType,

      args: {
        id: {
          type: new GraphQLNonNull(GraphQLInt),
        },
      },

      resolve(parent, args) {
        const course = courses.find(course => course.id === args.id);

        if (!course) {
          throw new Error("Course not found");
        }

        course.likes++;

        return course;
      },
    },
  },
});

/// =======================================
/// SCHEMA
/// =======================================

const schema = new GraphQLSchema({
  query: RootQuery,
  mutation: Mutation,
});

/// =======================================
/// GRAPHQL ENDPOINT
/// =======================================

app.use(
  "/graphql",
  graphqlHTTP({
    schema,
    graphiql: true,
  }),
);

/// =======================================
/// START SERVER
/// =======================================

app.listen(4000, () => {
  console.log("Server running on port 4000");
});
