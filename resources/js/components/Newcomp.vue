<template>
    <div>
        <div class="row new-srow__back">
            <div class="col-sm-12 col-md-6 col-lg-5">
                <div class="row newsupx">

                    <div class="col-sm-12 col-md-12 col-lg-6" v-for="post in posts.slice(0, 2)">
                        <a :href="`/post${post.id}`">
                            <div class="lefar-card">
                                <img :src="`/storage/${post.image}`">

                                <p>
                                    {{ post.title }}
                                </p>

                                <a href="`/post${post.id}`" role="button" class="btn btn-primary">Подробнее</a>
                            </div>
                        </a>
                    </div>

                </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-7">
                <div class="row newsupx">

                    <div class="col-sm-12 col-md-12 col-lg-4" v-for="post in posts.slice(2, 5)">
                        <a :href="`/post${post.id}`">
                            <div class="lefar-card">
                                <img :src="`/storage/${post.image}`">

                                <p>
                                    {{ post.title }}
                                </p>

                                <a :href="`/post${post.id}`" role="button" class="btn btn-primary">Подробнее</a>
                            </div>
                        </a>
                    </div>

                </div>
            </div>
        </div>

        <div class="row new-srow__back">
            <div class="col-sm-12 col-md-12 col-lg-5">
                <div class="yllow-area">
                    <div class="row">

                        <div class="yllow-card" v-for="post in posts.slice(5, 8)">
                            <a :href="`/post${post.id}`">
                                <img :src="`/storage/${post.image}`">
                            </a>
                            <a :href="`/post${post.id}`">
                                {{ post.title }}
                            </a>
                        </div>



                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-7">
                <div class="row newsupx">

                    <div class="col-sm-12 col-md-6 col-lg-4" v-for="post in posts.slice(8, 11)">
                        <a :href="`/post${post.id}`">
                            <div class="lefar-card">
                                <img :src="`/storage/${post.image}`">

                                <p>
                                    {{ post.title }}
                                </p>

                                <a :href="`/post${post.id}`" role="button" class="btn btn-primary">Подробнее</a>
                            </div>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
         props: {
            posts: Array,
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
