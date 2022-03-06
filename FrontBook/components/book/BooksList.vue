<template>
  <div>
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
        <p>{{ book.elease_day }}</p>
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
export default {
  props: { 
    books: { 
      type: Array,
      required: true,
    }
  }
}
</script>

<style>
</style> 
