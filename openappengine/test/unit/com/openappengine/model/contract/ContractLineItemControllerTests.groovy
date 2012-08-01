package com.openappengine.model.contract



import org.junit.*
import grails.test.mixin.*

@TestFor(ContractLineItemController)
@Mock(ContractLineItem)
class ContractLineItemControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contractLineItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contractLineItemInstanceList.size() == 0
        assert model.contractLineItemInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.contractLineItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contractLineItemInstance != null
        assert view == '/contractLineItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contractLineItem/show/1'
        assert controller.flash.message != null
        assert ContractLineItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contractLineItem/list'


        populateValidParams(params)
        def contractLineItem = new ContractLineItem(params)

        assert contractLineItem.save() != null

        params.id = contractLineItem.id

        def model = controller.show()

        assert model.contractLineItemInstance == contractLineItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contractLineItem/list'


        populateValidParams(params)
        def contractLineItem = new ContractLineItem(params)

        assert contractLineItem.save() != null

        params.id = contractLineItem.id

        def model = controller.edit()

        assert model.contractLineItemInstance == contractLineItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contractLineItem/list'

        response.reset()


        populateValidParams(params)
        def contractLineItem = new ContractLineItem(params)

        assert contractLineItem.save() != null

        // test invalid parameters in update
        params.id = contractLineItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contractLineItem/edit"
        assert model.contractLineItemInstance != null

        contractLineItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contractLineItem/show/$contractLineItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contractLineItem.clearErrors()

        populateValidParams(params)
        params.id = contractLineItem.id
        params.version = -1
        controller.update()

        assert view == "/contractLineItem/edit"
        assert model.contractLineItemInstance != null
        assert model.contractLineItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contractLineItem/list'

        response.reset()

        populateValidParams(params)
        def contractLineItem = new ContractLineItem(params)

        assert contractLineItem.save() != null
        assert ContractLineItem.count() == 1

        params.id = contractLineItem.id

        controller.delete()

        assert ContractLineItem.count() == 0
        assert ContractLineItem.get(contractLineItem.id) == null
        assert response.redirectedUrl == '/contractLineItem/list'
    }
}
