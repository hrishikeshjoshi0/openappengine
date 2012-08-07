package com.openappengine.model.billing



import org.junit.*
import grails.test.mixin.*

@TestFor(BillingCycleController)
@Mock(BillingCycle)
class BillingCycleControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/billingCycle/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.billingCycleInstanceList.size() == 0
        assert model.billingCycleInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.billingCycleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.billingCycleInstance != null
        assert view == '/billingCycle/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/billingCycle/show/1'
        assert controller.flash.message != null
        assert BillingCycle.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/billingCycle/list'


        populateValidParams(params)
        def billingCycle = new BillingCycle(params)

        assert billingCycle.save() != null

        params.id = billingCycle.id

        def model = controller.show()

        assert model.billingCycleInstance == billingCycle
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/billingCycle/list'


        populateValidParams(params)
        def billingCycle = new BillingCycle(params)

        assert billingCycle.save() != null

        params.id = billingCycle.id

        def model = controller.edit()

        assert model.billingCycleInstance == billingCycle
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/billingCycle/list'

        response.reset()


        populateValidParams(params)
        def billingCycle = new BillingCycle(params)

        assert billingCycle.save() != null

        // test invalid parameters in update
        params.id = billingCycle.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/billingCycle/edit"
        assert model.billingCycleInstance != null

        billingCycle.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/billingCycle/show/$billingCycle.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        billingCycle.clearErrors()

        populateValidParams(params)
        params.id = billingCycle.id
        params.version = -1
        controller.update()

        assert view == "/billingCycle/edit"
        assert model.billingCycleInstance != null
        assert model.billingCycleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/billingCycle/list'

        response.reset()

        populateValidParams(params)
        def billingCycle = new BillingCycle(params)

        assert billingCycle.save() != null
        assert BillingCycle.count() == 1

        params.id = billingCycle.id

        controller.delete()

        assert BillingCycle.count() == 0
        assert BillingCycle.get(billingCycle.id) == null
        assert response.redirectedUrl == '/billingCycle/list'
    }
}
