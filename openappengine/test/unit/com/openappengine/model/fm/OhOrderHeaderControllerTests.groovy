package com.openappengine.model.fm



import org.junit.*
import grails.test.mixin.*

@TestFor(OrderController)
@Mock(OhOrderHeader)
class OhOrderHeaderControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ohOrderHeader/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ohOrderHeaderInstanceList.size() == 0
        assert model.ohOrderHeaderInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ohOrderHeaderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ohOrderHeaderInstance != null
        assert view == '/ohOrderHeader/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ohOrderHeader/show/1'
        assert controller.flash.message != null
        assert OhOrderHeader.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ohOrderHeader/list'


        populateValidParams(params)
        def ohOrderHeader = new OhOrderHeader(params)

        assert ohOrderHeader.save() != null

        params.id = ohOrderHeader.id

        def model = controller.show()

        assert model.ohOrderHeaderInstance == ohOrderHeader
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ohOrderHeader/list'


        populateValidParams(params)
        def ohOrderHeader = new OhOrderHeader(params)

        assert ohOrderHeader.save() != null

        params.id = ohOrderHeader.id

        def model = controller.edit()

        assert model.ohOrderHeaderInstance == ohOrderHeader
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ohOrderHeader/list'

        response.reset()


        populateValidParams(params)
        def ohOrderHeader = new OhOrderHeader(params)

        assert ohOrderHeader.save() != null

        // test invalid parameters in update
        params.id = ohOrderHeader.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ohOrderHeader/edit"
        assert model.ohOrderHeaderInstance != null

        ohOrderHeader.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ohOrderHeader/show/$ohOrderHeader.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ohOrderHeader.clearErrors()

        populateValidParams(params)
        params.id = ohOrderHeader.id
        params.version = -1
        controller.update()

        assert view == "/ohOrderHeader/edit"
        assert model.ohOrderHeaderInstance != null
        assert model.ohOrderHeaderInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ohOrderHeader/list'

        response.reset()

        populateValidParams(params)
        def ohOrderHeader = new OhOrderHeader(params)

        assert ohOrderHeader.save() != null
        assert OhOrderHeader.count() == 1

        params.id = ohOrderHeader.id

        controller.delete()

        assert OhOrderHeader.count() == 0
        assert OhOrderHeader.get(ohOrderHeader.id) == null
        assert response.redirectedUrl == '/ohOrderHeader/list'
    }
}
