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
        <select v-model="query.parentCategoryId" @change="parentCategoriesIsSelected()">
          <option v-for="category in parentCategories()" :key="category.id" :value="category.id">{{ category.name }}</option>
        </select>
      </li>
      <li>
        <label>子のカテゴリー</label>
        <select v-model="query.categories_id_in" >
          <option v-for="category in childCategories(query.parentCategoryId)" :key="category.id" :value="parentCategoryId">{{ category.name }}</option>
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
      isSearch: false,
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
    },
    parentCategories() {
      // parent_idが存在しないデータだけを絞り込む
      const selectCategories = this.categories.filter(function(category){
        return category.parent_id === null;
      });
      return selectCategories;
    },
    parentCategoriesIsSelected() {
      this.isSearch = true;
    },
      // 親カテゴリーが選択されたidの物だけを絞り込むようにする。
      // 親カテゴリーが選択されていない場合は、子カテゴリーをすべて表示する。
    childCategories(parentCategoryId) {
      if(this.isSearch) {
        const selectCategories = this.categories.filter(function(category){
          return category.parent_id === parentCategoryId;
        })
        return selectCategories;
      } else {
        return this.categories;
      }
    }
  }
}
</script>

<style>
</style> 
