<template>
  <div>
    <h1>検索</h1>
    <ul>
      <li>
        <label>タイトル</label>
        <input type="text" v-model="query.title_cont">
      </li>
      <li>
        <label>著者</label>
        <input type="text" v-model="query.author_cont">
      </li>
      <li>
        <label>出版日</label>
        <input type="date" v-model="query.release_day_lteq">
        <input type="date" v-model="query.release_day_gteq">
        
      </li>
      <button @click="search">検索</button>
    </ul>
    <h1>一覧</h1>
    <ul v-for="book in books" :key="book.id">
      <li>
        <label>タイトル</label>
        <p>{{ book.title }}</p>
      </li>
      <li>
        <label>著者</label>
        <p>{{ book.author }}</p>
      </li>
      <li>
        <label>金額</label>
        <p>{{ book.price }}</p>
      </li>
      <li>
        <label>出版日</label>
        <p>{{ book.release_day }}</p>
      </li>
      <li>
        <label>在庫</label>
        <p v-if="book.stock == 0">すみません。ただいま在庫がありません</p>
        <p v-else>{{ book.stock }}</p>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";
import Qs from "qs";
export default {
  data() {
    return {
      query: {
        name_cont: '',
        author_cont: '',
        release_day_gteq: '',
        release_day_lteq: '',
      },
    };
  },
  props: { 
    books: { 
      type: Array,
      required: true,
    }
  },
  methods: {
    search() {
      axios.get("/api/books", { params: { q: this.query }, 
        paramsSerializer(params) {
          return Qs.stringify(params, { arrayFormat: "brackets" })
        }
      })
      .then((response) => {
        this.$store.commit("setBooks", response.data);
      })
    }
  }
}
</script>

<style>
</style> 
