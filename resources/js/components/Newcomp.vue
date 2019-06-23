<template>
    <div>
        <div class="row new-srow__back">
            <div class="col-sm-12 col-md-6 col-lg-5">
                <div class="row newsupx">

                    <div class="col-sm-12 col-md-12 col-lg-6" v-for="(post, index) in posts.slice(0, 2)">
                        <a :href="post.link" onclick="ym(54175381, 'reachGoal', 'LAND')">
                            <div class="lefar-card" :class="[!post.cols ? 'backeven' : '']">
                                <img :src="`${post.image}`">

                                <p>
                                  {{ post.title }}
                                </p>

                                <a :href="post.link" role="button" class="btn ">Подробнее</a>
                            </div>
                        </a>
                    </div>

                </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-7">
                <div class="row newsupx">

                    <div class="col-sm-12 col-md-12 col-lg-4" v-for="post in posts.slice(2, 5)">
                        <a :href="post.link" onclick="ym(54175381, 'reachGoal', 'LAND')">
                            <div class="lefar-card" :class="[!post.cols ? 'backeven' : '']">
                                <img :src="`${post.image}`">

                                <p class="prod-element">
                                    {{ post.title }}
                                </p>

                                <a :href="post.link" role="button" class="btn ">Подробнее</a>
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

                        <div class="yllow-card" v-for="post in posts.slice(5, 8)"  :class="post.color">
                            <a :href="post.link" onclick="ym(54175381, 'reachGoal', 'LAND')">
                                <img :src="`${post.image}`">
                            </a>
                            <a :href="post.link" onclick="ym(54175381, 'reachGoal', 'LAND')">
                                {{ post.title }}
                            </a>
                        </div>



                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-7">
                <div class="row newsupx">

                    <div class="col-sm-12 col-md-6 col-lg-4" v-for="post in posts.slice(8, 11)">
                        <a :href="post.link" target="_blank" onclick="ym(54175381, 'reachGoal', 'LAND')">
                            <div class="lefar-card"  :class="[!post.cols ? 'backeven' : '']">
                                <img :src="`${post.image}`">

                                <p>
                                    {{ post.title }} {{ post.cols }}
                                </p>

                                <a :href="post.link" role="button" class="btn" target="_blank" onclick="ym(54175381, 'reachGoal', 'LAND')">Подробнее</a>
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
            ops: Number,
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
