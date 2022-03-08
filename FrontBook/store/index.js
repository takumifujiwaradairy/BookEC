import Vuex from "vuex";
import axios from "axios";

const url = "api/books"
const categoryUrl = "api/categories"

const createStore = () => {
  return new Vuex.Store({
    state: () => ({
      books: [
      ],
      categories: [
      ]
    }),
    getters: {
      getBooks: (state) => {
        return state.books
      },
      getCategories: (state) => {
        return state.categories
      }
    },
    actions: {
      async fetchBooks({ commit }){
        await axios.get(url).then( response => {
          commit('setBooks', response.data)
        })
      },
      async fetchCategories({ commit }){
        await axios.get(categoryUrl).then( response => {
          commit('setCategories', response.data)
        })
      }
    },
    mutations: {
      setBooks: (state, books) => state.books = books,
      setCategories: (state, categories) => state.categories = categories,
    }
  })
}

export default createStore;