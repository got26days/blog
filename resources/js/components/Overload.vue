<template>

    <div>
        <newcomp v-for="(post, index) in posts"  :posts="post" :key="index"/>
    </div>

</template>

<script>
    import lazyload from '../directives/lazyload';


    export default {
        props: {
            ops: Number,
            postid: Number,
        },
        data() {
            return {
                posts: [],
                lastPost: '',
            }
        },
        directives: {
            lazyload
        },
        methods: {
            getInitialPosts() {

                axios.get(`/api/getposts0/post${this.postid}`)
                    .then(response => {
                        this.posts.push(response.data);
                    });

            },
            scroll(post) {
                window.onscroll = () => {
                    let bottomOfWindow = document.documentElement.scrollTop + window.innerHeight === document.documentElement
                        .offsetHeight;

                    if (bottomOfWindow) {
                        axios.get(`/api/getposts0/post${this.postid}`)
                            .then(response => {
                                if (response.data.length > 0) {
                                    this.posts.push(response.data);
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
    }

</script>
