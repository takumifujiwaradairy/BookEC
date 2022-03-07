<template>
  <div>
    <books-list :books="getBooks"/>
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
    ...mapActions(['fetchBooks'])
  },
  computed: { 
    ...mapGetters(['getBooks'])
  },
  created() { 
    this.fetchBooks()
  }
}
</script>

<style>

</style>