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
      <li>
        <label>親のカテゴリー</label>
        <select v-model="query.parentCategoryId">
          <option v-for="category in parentCategories" :key="category.id" :value="category.id">{{ category.name }}</option>
        </select>
      </li>
      <li>
        <label>子のカテゴリー</label>
        <select v-model="query.categories_id_in" >
          <option v-for="category in childCategories" :key="category.id" :value="category.id">{{ category.name }}</option>
        </select>
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
import { mapGetters } from 'vuex';
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
        categories_id_in: '',
        parentCategoryId: '',
      },
    };
  },
  props: { 
    books: { 
      type: Array,
      required: true,
    },
    categories: {
      type: Array,
      required: true,
    }
  },
  computed: {
    parentCategories: function() {
      const selectCategories = this.categories.filter(function(category){
        return category.parent_id === null;
      });
      return selectCategories;
    },
    childCategories() {
      if(this.query.parentCategoryId == '') {
        return this.categories;
      } else {
        const selectCategories = this.categories.filter(category => {
          return category.parent_id == this.query.parentCategoryId
        })
        return selectCategories;
      }
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
