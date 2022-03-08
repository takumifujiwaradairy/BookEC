<template>
  <div>
    <books-list :books="getBooks" :categories="getCategories"/>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';
import BooksList from '../components/book/BooksList.vue';

export default {
  components: {
    BooksList 
  },
  methods: { 
    ...mapActions(['fetchBooks', 'fetchCategories'])
  },
  computed: { 
    ...mapGetters(['getBooks', 'getCategories'])
  },
  created() { 
    this.fetchBooks()
    this.fetchCategories()
  }
}
</script>

<style>

</style>