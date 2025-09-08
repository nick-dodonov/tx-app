#include <iostream>
#include <Shared/Version.h>
#include <centurion.hpp>

int main(int argc, char** argv)
{
    std::cout << "Hello world!" << std::endl;
    std::cout << GetVersionDetailed() << std::endl;

    // try sdl wrapper
    const cen::sdl sdl;
    const cen::img img;
    const cen::mix mix;
    const cen::ttf ttf;

    cen::window window{"Hello world!"};
    cen::renderer renderer = window.make_renderer();

    window.show();

    bool running = true;
    while (running) {
        cen::event_handler event;
        while (event.poll()) {
            if (event.is(cen::event_type::quit)) {
                running = false;
            }
        }
        renderer.clear_with(cen::colors::coral);
        renderer.present();
    }

    window.hide();
    return 0;
}
