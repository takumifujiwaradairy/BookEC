import Vuex from "vuex";
import axios from "axios";

const url = "api/books"

const createStore = () => {
  return new Vuex.Store({
    state: () => ({
      books: [
      ],
    }),
    getters: {
      getBooks: (state) => {
        return state.books
      },
    },
    actions: {
      async fetchBooks({ commit }){
        await axios.get(url).then( response => {
          commit('setBooks', response.data)
        })
      }
    },
    mutations: {
      setBooks: (state, books) => state.books = books,
    }
  })
}

export default createStore;