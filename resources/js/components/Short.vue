<template>
    <div class="container solo-page">
        <div class="row padder-main-row">
            <div class="col-sm-12 col-md-6 col-lg-5 contnet">
                <div class="news-solo target">
                    <a href="/" class="prenewsaa">
                        <div class="prenews">
                            <img :src="'/storage/' + solo.image" alt="" height="315">
                            <div class="titletoppreviewmain">
                                {{ solo.title }}
                                <div class="area-watch">
                                    <a class="btn btn-primary" :href="solo.link" role="button"
                                        style="max-width: 190px;">Читать
                                        полностью</a>
                                    <div class="iconwatch2">
                                        <i class="fas fa-eye" v-if="solo.teaser1"></i> <span>{{ solo.teaser1 }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <div class="news-solo__teaser">

                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-7">
                <div class="width-card right-pos-cart" v-for="post in firstposts.slice(0,2)">
                    <a :href="post.link" target="_blank">
                        <img :src="post.image" style="height: 90px;">
                    </a>
                    <div class="wc-content">
                        <a :href="post.link" target="_blank">
                            {{ post.title }}
                        </a>
                        <div class="area-watch">
                            <a :href="post.link" role="button" target="_blank" class="btn">Подробнее</a>
                            <div class="iconwatch2">
                                <i class="fas fa-eye" v-if="post.teaser1"></i> <span>{{ post.teaser1 }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="new-srow">
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-5">
                    <div class="row newsupx">
                        <div class="col-sm-12 col-md-12 col-lg-6" v-for="post in firstposts.slice(2,4)">
                            <a :href="post.link">
                                <div class="lefar-card">
                                    <img :src="post.image">
                                    <p>{{ post.title }}</p>
                                    <div class="area-watch">
                                        <a :href="post.link" role="button" target="_blank"
                                            class="btn btn-primary">Подробнее</a>
                                        <div class="iconwatch2">
                                            <i class="fas fa-eye" v-if="post.teaser1"></i>
                                            <span>{{ post.teaser1 }}</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-7">
                    <div class="row newsupx">
                        <div class="col-sm-12 col-md-12 col-lg-4" v-for="post in firstposts.slice(4,7)">
                            <a :href="post.link">
                                <div class="lefar-card">
                                    <img :src="post.image">
                                    <p>{{ post.title }}</p>
                                    <div class="area-watch">
                                        <a :href="post.link" role="button" target="_blank"
                                            class="btn btn-primary">Подробнее</a>
                                        <div class="iconwatch2">
                                            <i class="fas fa-eye" v-if="post.teaser1"></i>
                                            <span>{{ post.teaser1 }}</span>
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
                            <div class="yllow-card" v-for="post in firstposts.slice(7,10)">
                                <a :href="post.link">
                                    <img :src="post.image">
                                </a>
                                <a :href="post.link">
                                    {{ post.title }}
                                </a>
                                <div class="iconwatch3">
                                    <i class="fas fa-eye" v-if="post.teaser1"></i> <span>{{ post.teaser1 }}</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6 col-lg-4">
                            <div class="yllow-card" v-for="post in firstposts.slice(10,13)">
                                <a :href="post.link">
                                    <img :src="post.image">
                                </a>
                                <a :href="post.link">
                                    {{ post.title }}
                                </a>
                                <div class="iconwatch3">
                                    <i class="fas fa-eye" v-if="post.teaser1"></i> <span>{{ post.teaser1 }}</span>
                                </div>

                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6 col-lg-4">
                            <div class="yllow-card" v-for="post in firstposts.slice(13,16)">
                                <a :href="post.link">
                                    <img :src="post.image">
                                </a>
                                <a :href="post.link">
                                    {{ post.title }}
                                </a>
                                <div class="iconwatch3">
                                    <i class="fas fa-eye" v-if="post.teaser1"></i> <span>{{ post.teaser1 }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <shortcomp v-for="(post, index) in posts" :posts="post" :key="index" />
    </div>
</template>

<script>
    import lazyload from '../directives/lazyload';

    export default {
        props: ['solo', 'short'],
        data() {
            return {
                firstposts: [],
                posts: [],
            }
        },
        directives: {
            lazyload
        },
        mounted() {
            this.getInitialPosts();
            this.scroll(1);

        },
        methods: {
            getInitialPosts() {
                
                axios.get(`/short/getposts${this.solo.id}`)
                    .then(response => {
                        this.firstposts = response.data;
                    });

            },
            scroll(post) {
                window.onscroll = () => {
                    let bottomOfWindow = document.documentElement.scrollTop + window.innerHeight === document
                        .documentElement
                        .offsetHeight;

                    if (bottomOfWindow) {
                        axios.get(`/short/getposts${this.solo.id}`)
                            .then(response => {
                                if (response.data.length > 0) {
                                    this.posts.push(response.data);
                                }
                            });
                    }
                };
            },
        }
    }

</script>
