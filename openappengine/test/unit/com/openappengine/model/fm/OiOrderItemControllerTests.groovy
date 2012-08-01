package com.openappengine.model.fm



import org.junit.*
import grails.test.mixin.*

@TestFor(OiOrderItemController)
@Mock(OiOrderItem)
class OiOrderItemControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/oiOrderItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.oiOrderItemInstanceList.size() == 0
        assert model.oiOrderItemInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.oiOrderItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.oiOrderItemInstance != null
        assert view == '/oiOrderItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/oiOrderItem/show/1'
        assert controller.flash.message != null
        assert OiOrderItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/oiOrderItem/list'


        populateValidParams(params)
        def oiOrderItem = new OiOrderItem(params)

        assert oiOrderItem.save() != null

        params.id = oiOrderItem.id

        def model = controller.show()

        assert model.oiOrderItemInstance == oiOrderItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/oiOrderItem/list'


        populateValidParams(params)
        def oiOrderItem = new OiOrderItem(params)

        assert oiOrderItem.save() != null

        params.id = oiOrderItem.id

        def model = controller.edit()

        assert model.oiOrderItemInstance == oiOrderItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/oiOrderItem/list'

        response.reset()


        populateValidParams(params)
        def oiOrderItem = new OiOrderItem(params)

        assert oiOrderItem.save() != null

        // test invalid parameters in update
        params.id = oiOrderItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/oiOrderItem/edit"
        assert model.oiOrderItemInstance != null

        oiOrderItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/oiOrderItem/show/$oiOrderItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        oiOrderItem.clearErrors()

        populateValidParams(params)
        params.id = oiOrderItem.id
        params.version = -1
        controller.update()

        assert view == "/oiOrderItem/edit"
        assert model.oiOrderItemInstance != null
        assert model.oiOrderItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/oiOrderItem/list'

        response.reset()

        populateValidParams(params)
        def oiOrderItem = new OiOrderItem(params)

        assert oiOrderItem.save() != null
        assert OiOrderItem.count() == 1

        params.id = oiOrderItem.id

        controller.delete()

        assert OiOrderItem.count() == 0
        assert OiOrderItem.get(oiOrderItem.id) == null
        assert response.redirectedUrl == '/oiOrderItem/list'
    }
}
