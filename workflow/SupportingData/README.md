# SupportingData #

This folder contains folders for supporting data maps and layers.
These products are not visible in the InfoMapper but provide files that
are included in other maps.

For example, the Continental Divide layer group and corresponding layer are included in
multiple maps but do not have a dedicated "Basin Entities" or other map that highlights the layer.

The recommended approach to implementing supporting data is as follows: 

1. **Layer:**
    1. **Use a third-party layer as is:** Evaluate whether a `SupportingData` product is necessary.
       It may be sufficient to add a layer to a map using a link (such as to GeoJSON file)
       and not create a layer or map within an InfoMapper implementation.
    2. **Process a layer:**  If supporting data require processing to create,
       it is recommended that such work occur in a workflow in a GitHub repository
       and that the products are published on the
       [data.openwaterfoundation.org](https://data.openwaterfoundation.org) website (or similar).
3. **Layer documentation:**
    1. **Use third-party documentation as is:**
       If a published dataset has a landing page that provides sufficient information,
       then that URL can be used in the `docPath` property for the layer,
       in which case InfoMapper will show the publisher's documentation.
    2. **Create local documenation:**
       If the documentation for a published layer is insufficient or more context is desired,
       then a local MarkDown file can be created, similar to the
       `layers/*.md` files for these supporting data layers.
       For example, add additional information and then link to the publisher's documentation.
4. **Map:**
    1. **Map congiguration:**
       It is useful to create a map to review the map layer.
       For example, a map can be created in the GeoProcessor to view a supporting layer
       before it is used in other maps.
       If a map is created, it does not need to be copied to the InfoMapper production files.
    2. **Layer configuration files used in a map:**
       Layer configuration files used in a map such as event handler and classification configuration
       must be copied to the InfoMapper production files so that other maps in the InfoMapper application can use.
       If such files are published in the original source, they can be used by linking to them.

See the README files in each folder for more information about a specific product.
