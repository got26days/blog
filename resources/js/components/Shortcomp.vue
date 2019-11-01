<template>
    <div class="new-srow">
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-5">
                <div class="row newsupx">
                    <div class="col-sm-12 col-md-12 col-lg-6" v-for="post in posts.slice(2,4)">
                        <a :href="post.link">
                            <div class="lefar-card">
                                <img :src="post.image">
                                <p>{{ post.title }}</p>
                                <div class="area-watch">
                                    <a :href="post.link" role="button" target="_blank"
                                        class="btn btn-primary">Подробнее</a>
                                    <div class="iconwatch2">
                                        <i class="fas fa-eye" v-if="post.teaser1"></i> <span>{{ post.teaser1 }}</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-7">
                <div class="row newsupx">
                    <div class="col-sm-12 col-md-12 col-lg-4" v-for="post in posts.slice(4,7)">
                        <a :href="post.link">
                            <div class="lefar-card">
                                <img :src="post.image">
                                <p>{{ post.title }}</p>
                                <div class="area-watch">
                                    <a :href="post.link" role="button" target="_blank"
                                        class="btn btn-primary">Подробнее</a>
                                    <div class="iconwatch2">
                                        <i class="fas fa-eye" v-if="post.teaser1"></i> <span>{{ post.teaser1 }}</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row new-srow__back">
            <div class="yllow-area">
                <div class="row">
                    <div class="col-sm-12 col-md-6 col-lg-4">
                        <div class="yllow-card" v-for="post in posts.slice(7,10)">
                            <a :href="post.link">
                                <img :src="post.image">
                            </a>
                            <a :href="post.link">
                                {{ post.title }}
                            </a>
                            <div class="iconwatch2">
                                <i class="fas fa-eye" v-if="post.teaser1"></i> <span>{{ post.teaser1 }}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-4">
                        <div class="yllow-card" v-for="post in posts.slice(10,13)">
                            <a :href="post.link">
                                <img :src="post.image">
                            </a>
                            <a :href="post.link">
                                {{ post.title }}
                            </a>
                            <div class="iconwatch2">
                                <i class="fas fa-eye" v-if="post.teaser1"></i> <span>{{ post.teaser1 }}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-4">
                        <div class="yllow-card" v-for="post in posts.slice(13,16)">
                            <a :href="post.link">
                                <img :src="post.image">
                            </a>
                            <a :href="post.link">
                                {{ post.title }}
                            </a>
                            <div class="iconwatch2">
                                <i class="fas fa-eye" v-if="post.teaser1"></i> <span>{{ post.teaser1 }}</span>
                            </div>
                        </div>
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
