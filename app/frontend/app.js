import { createApp, h } from "vue";
import { createInertiaApp, Head, Link } from "@inertiajs/vue3";
import { resolvePage } from '~/pages'

export default function () {
  createInertiaApp({
    resolve: resolvePage,
    progress: {
      // The delay after which the progress bar will appear, in milliseconds...
      delay: 50,
      // Whether the NProgress spinner will be shown...
      showSpinner: false,
    },
    setup({ el, App, props, plugin }) {
      const app = createApp({ render: () => h(App, props) });
      app.use(plugin)

      if (el) {
        app.mount(el)
      }
    },
  });
}