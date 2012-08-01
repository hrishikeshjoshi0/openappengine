package com.openappengine.model.product



import org.junit.*
import grails.test.mixin.*

@TestFor(ProductPriceController)
@Mock(ProdProductPrice)
class ProdProductPriceControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/prodProductPrice/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.prodProductPriceInstanceList.size() == 0
        assert model.prodProductPriceInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.prodProductPriceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.prodProductPriceInstance != null
        assert view == '/prodProductPrice/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/prodProductPrice/show/1'
        assert controller.flash.message != null
        assert ProdProductPrice.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/prodProductPrice/list'


        populateValidParams(params)
        def prodProductPrice = new ProdProductPrice(params)

        assert prodProductPrice.save() != null

        params.id = prodProductPrice.id

        def model = controller.show()

        assert model.prodProductPriceInstance == prodProductPrice
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/prodProductPrice/list'


        populateValidParams(params)
        def prodProductPrice = new ProdProductPrice(params)

        assert prodProductPrice.save() != null

        params.id = prodProductPrice.id

        def model = controller.edit()

        assert model.prodProductPriceInstance == prodProductPrice
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/prodProductPrice/list'

        response.reset()


        populateValidParams(params)
        def prodProductPrice = new ProdProductPrice(params)

        assert prodProductPrice.save() != null

        // test invalid parameters in update
        params.id = prodProductPrice.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/prodProductPrice/edit"
        assert model.prodProductPriceInstance != null

        prodProductPrice.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/prodProductPrice/show/$prodProductPrice.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        prodProductPrice.clearErrors()

        populateValidParams(params)
        params.id = prodProductPrice.id
        params.version = -1
        controller.update()

        assert view == "/prodProductPrice/edit"
        assert model.prodProductPriceInstance != null
        assert model.prodProductPriceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/prodProductPrice/list'

        response.reset()

        populateValidParams(params)
        def prodProductPrice = new ProdProductPrice(params)

        assert prodProductPrice.save() != null
        assert ProdProductPrice.count() == 1

        params.id = prodProductPrice.id

        controller.delete()

        assert ProdProductPrice.count() == 0
        assert ProdProductPrice.get(prodProductPrice.id) == null
        assert response.redirectedUrl == '/prodProductPrice/list'
    }
}
