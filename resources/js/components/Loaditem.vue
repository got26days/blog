<template>
    <div class="row padder-main-row overboot">

        <div class="col-sm-12 col-md-4 col-lg-4" v-for="post in posts">
            <div class="over-card-new">
                <a :href="post.link" class="utm_links" target="_blank">
                    <div class="teaser_image">
                        <img  class="lazyload-done" :data-src="`/storage/${post.image}`" v-lazyload>
                    </div>
                    <div class="lk_text-yellow-area">{{  post.title }}</div>
                    <div class="area-watch">
                    <a class="btn " role="button" :href="post.link" target="_blank">Подробнее</a>
                    <div class="iconwatch2 " v-if="post.teaser1 != '0'">
                                    <i class="fas fa-eye"></i> <span>{{ post.teaser1 }}</span>
                                </div>
                            </div>
                </a>
            </div>
        </div>
        
    </div>
</template>

<script>
     import lazyload  from '../directives/lazyload';
     
    //  Главная страница

    export default {
        props: {
            option: Number,
            lastop: Number,
        },
        data () {
            return {
                posts: [],
                lastPost: '',
                
            }
        },
        directives: {
            lazyload
        },
        methods: {
            getInitialPosts () {
        
                axios.get(`/api/posts${this.option}/last${this.lastop}`)
                    .then(response => {
                        this.posts = response.data;
                    });
   
            },
            scroll (post) {
                window.onscroll = () => {
                let bottomOfWindow = document.documentElement.scrollTop + window.innerHeight === document.documentElement.offsetHeight;

                    if (bottomOfWindow) {
                        axios.get(`/api/posts${this.option}/last${this.postLastCount}`)
                        .then(response => {
                            if(response.data.length > 0) {
                                var step;
                                for (step = 0; step < response.data.length; step++) {
                                    this.posts.push(response.data[step]);
                                }
                            }
                        });
                    }
                };
            },
        },
        mounted() {
            this.getInitialPosts();
            
             this.scroll(1);
        },
        computed: {
            postLastCount() {
                if (this.posts.length == 0) {
                    return 0;
                }
                return this.posts[this.posts.length - 1].id;
            }
        }
    }
</script>
